{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-extra
    noto-fonts-cjk-sans
    ];

    fonts.fontconfig = {
        enable = true;
        localConf = ''
        <fontconfig>
            <alias>
            <family>sans-serif</family>
            <prefer>
                <family>Thonburi</family>
            </prefer>
            </alias>

            <!-- Specific Thai language support -->
            <match target="pattern">
            <test name="lang">
                <string>th</string>
            </test>
            <edit name="family" mode="prepend">
                <string>Thonburi</string>
            </edit>
            </match>
        </fontconfig>
        '';
    };
}
