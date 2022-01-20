/// <summary>
/// Page Mold Picture (ID 70405).
/// </summary>
page 70407 "Mold Picture2"
{
    Caption = 'Mold Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "Injection Mold";

    layout
    {
        area(content)
        {
            field(Picture; Rec.Picture2)
            {
                ToolTip = 'Specifies the value of the Picture 2 field.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(TakePicture)
            {
                ApplicationArea = All;
                Caption = 'Take';
                Image = Camera;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Activate the camera on the device.';
                Visible = CameraAvailable AND (HideActions = FALSE);

                trigger OnAction()
                begin
                    TakeNewPicture;
                end;
            }
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Import';
                Image = Import;
                ToolTip = 'Import a picture file.';
                Visible = HideActions = FALSE;

                trigger OnAction()
                begin
                    ImportPict;
                end;
            }
            action(ExportFile)
            {
                ApplicationArea = All;
                Caption = 'Export';
                Enabled = DeleteExportEnabled;
                Image = Export;
                ToolTip = 'Export the picture to a file.';
                Visible = HideActions = FALSE;

                trigger OnAction()
                var
                    PicInStream: InStream;
                    Index: Integer;
                    TenantMedia: Record "Tenant Media";
                    FileName: Text;
                begin
                    if Rec.Picture2.Count = 0 then
                        exit;

                    for Index := 1 to Rec.Picture2.Count do begin
                        if TenantMedia.Get(Rec.Picture2.Item(Index)) then begin
                            TenantMedia.calcfields(Content);
                            if TenantMedia.Content.HasValue then begin
                                FileName := Rec.TableCaption + '_Image' + format(Index) + GetTenantMediaFileExtension(TenantMedia);
                                TenantMedia.Content.CreateInStream(PicInstream);
                                DownloadFromStream(PicInstream, '', '', '', FileName);
                            end;
                        end;
                    end;
                end;
            }
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Enabled = DeleteExportEnabled;
                Image = Delete;
                ToolTip = 'Delete the record.';
                Visible = HideActions = FALSE;

                trigger OnAction()
                begin
                    DeleteItemPicture;
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        SetEditableOnPictureActions;
    end;

    trigger OnOpenPage()
    begin
        CameraAvailable := Camera.IsAvailable();
    end;

    var
        Camera: Codeunit Camera;
        [InDataSet]
        CameraAvailable: Boolean;
        OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
        DeleteImageQst: Label 'Are you sure you want to delete the picture?';
        SelectPictureTxt: Label 'Select a picture to upload';
        DeleteExportEnabled: Boolean;
        HideActions: Boolean;
        MustSpecifyDescriptionErr: Label 'You must add a description to the item before you can import a picture.';
        MimeTypeTok: Label 'image/jpeg', Locked = true;

    /// <summary>
    /// TakeNewPicture.
    /// </summary>
    procedure TakeNewPicture()
    begin
        Rec.Find();
        Rec.TestField("No.");
        Rec.TestField(Description);

        OnAfterTakeNewPicture(Rec, DoTakeNewPicture());
    end;

    /// <summary>
    /// ImportPict.
    /// </summary>
    procedure ImportPict()
    var
        PicInStream: InStream;
        FromFileNAme: Text;
        OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?', Locked = false, MaxLength = 250;
    begin
        if Rec.Picture2.Count > 0 then
            if not Confirm(OverrideImageQst) then
                exit;

        if UploadIntoStream('Import Picture', '', 'All Files (*.*)|*.*', FromFileName, PicInStream) then begin
            Clear(Rec.Picture2);
            Rec.Picture2.ImportStream(PicInStream, FromFileName);
            Rec.Modify(true);
        end;
    end;

    local procedure GetTenantMediaFileExtension(var TenantMedia: Record "Tenant Media"): Text;
    begin
        case TenantMedia."Mime Type" of
            'image/jpeg':
                exit('.jpg');
            'image/png':
                exit('.png');
            'image/bmp':
                exit('.bmp');
            'image/gif':
                exit('.gif');
            'image/tiff':
                exit('.tiff');
            'image/wmf':
                exit('.wmf');
        end;
    end;

    local procedure DoTakeNewPicture(): Boolean
    var
        PictureInstream: InStream;
        PictureDescription: Text;
    begin
        if Rec.Picture2.Count() > 0 then
            if not Confirm(OverrideImageQst) then
                exit(false);

        if Camera.GetPicture(PictureInstream, PictureDescription) then begin
            Clear(Rec.Picture2);
            Rec.Picture2.ImportStream(PictureInstream, PictureDescription, MimeTypeTok);
            Rec.Modify(true);
            exit(true);
        end;

        exit(false);
    end;

    local procedure SetEditableOnPictureActions()
    begin
        DeleteExportEnabled := Rec.Picture2.Count <> 0;
    end;

    /// <summary>
    /// IsCameraAvailable.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    procedure IsCameraAvailable(): Boolean
    begin
        exit(Camera.IsAvailable());
    end;

    /// <summary>
    /// SetHideActions.
    /// </summary>
    procedure SetHideActions()
    begin
        HideActions := true;
    end;

    /// <summary>
    /// DeleteItemPicture.
    /// </summary>
    procedure DeleteItemPicture()
    begin
        Rec.TestField("No.");

        if not Confirm(DeleteImageQst) then
            exit;

        Clear(Rec.Picture2);
        Rec.Modify(true);

        OnAfterDeleteItemPicture(Rec);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterDeleteItemPicture(var Mold: Record "Injection Mold")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterTakeNewPicture(var Mold: Record "Injection Mold"; IsPictureAdded: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnImportFromDeviceOnAfterModify(var Mold: Record "Injection Mold")
    begin
    end;
}


