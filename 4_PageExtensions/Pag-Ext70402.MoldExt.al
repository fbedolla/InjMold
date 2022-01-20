/// <summary>
/// PageExtension MoldExt (ID 70402) extends Record Manufacturing Manager RC.
/// </summary>
pageextension 70402 MoldExt extends "Manufacturing Manager RC"
{
    actions
    {
        addafter(Group)
        {
            group(Molds)
            {
               Caption = 'Molds';

                action(MoldsList)
                {
                    Caption = 'Molds List';
                    ApplicationArea = All;
                    RunObject = page "Injection Mold List";
                }
                action(InjMoldProc)
                {
                    Caption = 'Injection Mold Processes';
                    ApplicationArea = All;
                    RunObject = page "Injection Mold Processes";
                }
                action(MoldMat)
                {
                    Caption = 'Mold Materials List';
                    ApplicationArea = All;
                    RunObject = page "Mold Material";
                }
            }
        }
    }
}
