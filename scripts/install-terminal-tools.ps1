# Install Terminal and CLI Tools
Write-Host "=== Installing Terminal & CLI Tools ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Windows Terminal
Write-Host "`n[1/5] Installing Windows Terminal..." -ForegroundColor Yellow
scoop bucket add extras
scoop install windows-terminal
Write-Host "[OK] Windows Terminal installed" -ForegroundColor Green

# Oh My Posh
Write-Host "`n[2/5] Installing Oh My Posh..." -ForegroundColor Yellow
scoop install oh-my-posh
Write-Host "[OK] Oh My Posh installed" -ForegroundColor Green

# Fonts for Oh My Posh
Write-Host "`n[3/5] Installing Nerd Fonts..." -ForegroundColor Yellow
scoop bucket add nerd-fonts
scoop install FiraCode-NF-Mono
Write-Host "[OK] FiraCode Nerd Font installed" -ForegroundColor Green

# fzf (fuzzy finder)
Write-Host "`n[4/5] Installing fzf..." -ForegroundColor Yellow
scoop install fzf
Write-Host "[OK] fzf installed" -ForegroundColor Green

# Additional CLI tools
Write-Host "`n[5/5] Installing additional CLI tools..." -ForegroundColor Yellow
scoop install bat       # Better cat
scoop install ripgrep   # Better grep
scoop install fd        # Better find
scoop install jq        # JSON processor
scoop install tldr      # Simplified man pages
Write-Host "[OK] CLI tools installed" -ForegroundColor Green

Write-Host "`n[OK] All terminal tools installed!" -ForegroundColor Green

Write-Host "`n=== Setup Oh My Posh ===" -ForegroundColor Yellow
Write-Host "Add to your PowerShell profile:" -ForegroundColor Cyan
Write-Host @"

  # Oh My Posh
  oh-my-posh init pwsh --config `$env:POSH_THEMES_PATH\paradox.omp.json | Invoke-Expression

  # PSReadLine (better command history)
  Set-PSReadLineOption -PredictionSource History
  Set-PSReadLineOption -PredictionViewStyle ListView
"@ -ForegroundColor White

Write-Host "`nTo edit your profile:" -ForegroundColor Cyan
Write-Host "  notepad `$PROFILE" -ForegroundColor White

Write-Host "`n=== Available Oh My Posh Themes ===" -ForegroundColor Yellow
Write-Host "View all themes:" -ForegroundColor Cyan
Write-Host "  Get-PoshThemes" -ForegroundColor White
Write-Host "`nPopular themes: paradox, agnoster, powerlevel10k_rainbow, dracula" -ForegroundColor Cyan

Write-Host "`n=== New CLI Tools ===" -ForegroundColor Yellow
Write-Host "bat:     bat file.txt          # Better cat with syntax highlighting" -ForegroundColor Cyan
Write-Host "rg:      rg 'pattern'          # Fast search (ripgrep)" -ForegroundColor Cyan
Write-Host "fd:      fd pattern            # Fast file finder" -ForegroundColor Cyan
Write-Host "fzf:     fzf                   # Fuzzy finder (interactive)" -ForegroundColor Cyan
Write-Host "jq:      cat data.json | jq    # JSON processor" -ForegroundColor Cyan
Write-Host "tldr:    tldr command          # Quick help" -ForegroundColor Cyan
