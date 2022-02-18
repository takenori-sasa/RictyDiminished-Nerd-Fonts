# !/bin/zsh
brew install rg ghq fontforge
ghq get --shallow git@github.com:ryanoasis/nerd-fonts.git
fonts=$(rg --files --max-depth 1 --hidden --follow --glob "*.ttf")
if [[ -n "$fonts" ]]; then
    echo $fonts | while read font; do
    fontforge -script $(ghq root)/github.com/ryanoasis/nerd-fonts/font-patcher ./$font -c -w -o ./nerd-fonts-fontpatched
done
fi
