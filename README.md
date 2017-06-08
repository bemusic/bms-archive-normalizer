# bms-archive-normalizer

Given a BMS/bmson archive (.zip .rar .lzh .7z), this tool will normalize the archive structure and file format. This makes it easy to distribute BMS archives.

- Result is a `.zip` file.
    - File names are encoded as UTF-8.
    - No nested folders.
        - This tool will error if note chart files (.bms .bme .bml .pms .bmson) are found in multiple locations.
- `.wav` samples will be converted to `.ogg` files with encoding quality of 5.
    - Accoding to [Hydrogenaudio](http://wiki.hydrogenaud.io/index.php?title=Recommended_Ogg_Vorbis#Recommended_Encoder_Settings) most users agree that this encoding quality achieves transparency.
