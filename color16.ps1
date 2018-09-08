@(
    "black      "
    "darkblue   "
    "darkgreen  "
    "darkcyan   "
    "darkred    "
    "darkmagenta"
    "darkyellow "
    "gray       "
    "darkgray   "
    "blue       "
    "green      "
    "cyan       "
    "red        "
    "magenta    "
    "yellow     "
    "white      "
) | % {
    Write-Host $_ -ForegroundColor $_ -NoNewline
    Write-Host $_ -ForegroundColor $_ -BackGroundColor white
}