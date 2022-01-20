permissionset 70400 MoldCtrl
{
    Assignable = true;
    Caption = 'MoldCtrl', MaxLength = 30;
    IncludedPermissionSets =
        "D365 BASIC",
        "D365 FA, EDIT",
        "D365PREM MFG, EDIT",
        "Manufacturing - Admin",
        "Manufacturing Design - Edit",
        "Manufacturing Planning - Edit";
    Permissions =
        table "Mold Material" = X,
        tabledata "Mold Material" = RMID,
        table "Injection Mold. Processes" = X,
        tabledata "Injection Mold. Processes" = RMID,
        table "Mold Use Entry" = X,
        tabledata "Mold Use Entry" = RMID,
        table "Injection Mold Control Setup" = X,
        tabledata "Injection Mold Control Setup" = RMID,
        table "Injection Mold" = X,
        tabledata "Injection Mold" = RMID,
        codeunit MoldPostingFunctions = X,
        page "Mold Use Entry" = X,
        page "Mold Picture1" = X,
        page "Injection Mold List" = X,
        page "Injection Mold Setup card" = X,
        page "Mold Picture" = X,
        page "Mold Picture2" = X,
        page "Mold Used Quantities" = X,
        page "Injection Mold Card" = X,
        page MoldActivities = X,
        page "Injection Mold Processes" = X,
        page "Mold Material" = X;
}
