$Paths = @(
    @{
        SymbolicLinkPath = "C:\Users\Jude\AppData\Roaming\Cursor\User\snippets"
        TargetPath = "C:\Users\Jude\AppData\Roaming\Code\User\snippets"
    },
    @{
        SymbolicLinkPath = "C:\Users\Jude\AppData\Roaming\Cursor\User\keybindings.json"
        TargetPath = "C:\Users\Jude\AppData\Roaming\Code\User\keybindings.json"
    },
    @{
        SymbolicLinkPath = "C:\Users\Jude\AppData\Roaming\Cursor\User\settings.json"
        TargetPath = "C:\Users\Jude\AppData\Roaming\Code\User\settings.json"
    }
)

function Create-SymbolicLink {
    param (
        [string]$SymbolicLinkPath,
        [string]$TargetPath
    )

    if (Test-Path $SymbolicLinkPath) {
        Write-Output "The symbolic link or file at '$SymbolicLinkPath' already exists."
    } elseif (Test-Path $TargetPath) {
        New-Item -ItemType SymbolicLink -Path $SymbolicLinkPath -Target $TargetPath
        Write-Output "Symbolic link created successfully at '$SymbolicLinkPath' pointing to '$TargetPath'."
    } else {
        Write-Output "The target path '$TargetPath' does not exist. Cannot create symbolic link."
    }
}

foreach ($Path in $Paths) {
    Create-SymbolicLink -SymbolicLinkPath $Path.SymbolicLinkPath -TargetPath $Path.TargetPath
}