/// <summary>
/// Codeunit MoldPostingFunctions (ID 70400).
/// </summary>
codeunit 70400 MoldPostingFunctions
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly-Post", 'OnAfterPostedAssemblyLineInsert', '', true, true)]
    local procedure InsMoldEntryfromRes(var PostedAssemblyLine: Record "Posted Assembly Line")
    var
        MoldUseEntry: Record "Mold Use Entry";
        Res: Record Resource;
    begin
        if PostedAssemblyLine.Type = PostedAssemblyLine.Type::Resource then begin
            Res.Reset();
            Res.SetRange(Res."No.", PostedAssemblyLine."No.");
            Res.SetFilter("Mold No.", '>%1', '');
            if Res.FindSet() then
                MoldUseEntry.Insert(true);
            MoldUseEntry."Document No." := PostedAssemblyLine."Document No.";
            MoldUseEntry."Entry Type" := MoldUseEntry."Entry Type"::"Assembly Order";
            MoldUseEntry."Mold No." := Res."Mold No.";
            MoldUseEntry.Description := PostedAssemblyLine.Description;
            MoldUseEntry.Quantity := GetAssyQty(PostedAssemblyLine."Document No.");
            MoldUseEntry."Global Dimension 1 Code" := PostedAssemblyLine."Shortcut Dimension 1 Code";
            MoldUseEntry."Global Dimension 2 Code" := PostedAssemblyLine."Shortcut Dimension 2 Code";
            MoldUseEntry.Modify(true);
        end;
    end;

    /// <summary>
    /// GetAssyQty.
    /// </summary>
    /// <param name="DocNo">Code[20].</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure GetAssyQty(DocNo: Code[20]): Decimal
    var
        PostAssyHdr: Record "Posted Assembly Header";
    begin
        PostAssyHdr.Reset();
        PostAssyHdr.SetRange("No.", DocNo);
        if PostAssyHdr.FindSet() then
            exit(PostAssyHdr.Quantity);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterPostOutput', '', true, true)]
    local procedure InsMoldEntryfromProd(var ProdOrderLine: Record "Prod. Order Line")
    var
        ProdOrdRouLine: Record "Prod. Order Routing Line";
        MacCen: Record "Machine Center";
        MoldUseEntry: Record "Mold Use Entry";
    begin
        if ProdOrderLine.Quantity <> 0 then begin
            ProdOrdRouLine.Reset();
            ProdOrdRouLine.SetRange(Type, ProdOrdRouLine.Type::"Machine Center");
            ProdOrdRouLine.SetRange("Prod. Order No.", ProdOrderLine."Prod. Order No.");
            if ProdOrdRouLine.findset then
                repeat
                    MacCen.Reset();
                    MacCen.SetRange("No.", ProdOrdRouLine."No.");
                    MacCen.SetFilter("Mold No.", '>%1', '');
                    if MacCen.FindSet() then begin
                        MoldUseEntry.Insert(true);
                        MoldUseEntry."Document No." := ProdOrdRouLine."Prod. Order No.";
                        MoldUseEntry."Entry Type" := MoldUseEntry."Entry Type"::"Production Order";
                        MoldUseEntry."Mold No." := MacCen."Mold No.";
                        MoldUseEntry.Description := ProdOrdRouLine.Description;
                        MoldUseEntry.Quantity := ProdOrderLine."Finished Quantity";
                        MoldUseEntry."Global Dimension 1 Code" := ProdOrderLine."Shortcut Dimension 1 Code";
                        MoldUseEntry."Global Dimension 2 Code" := ProdOrderLine."Shortcut Dimension 2 Code";
                        MoldUseEntry.Modify(true);
                    end;
                until ProdOrdRouLine.Next() = 0;
        end;
    end;
}
