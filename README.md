# bms-archive-normalizer

Given a BMS/bmson archive (.zip .rar .lzh .7z), this tool will normalize the archive structure and file format. This makes it easy to automatically process BMS archives for (e.g. BMS distribution, generating preview music, etc.).

- Result is a `.zip` file.
    - File names are encoded as UTF-8.
    - No nested folders.
        - This tool will error if note chart files (.bms .bme .bml .pms .bmson) are found in multiple locations.
- `.wav` samples will be converted to `.ogg` files with encoding quality of 5.
    - Accoding to [Hydrogenaudio](http://wiki.hydrogenaud.io/index.php?title=Recommended_Ogg_Vorbis#Recommended_Encoder_Settings) most users agree that this encoding quality achieves transparency.

## Fail-safes

Since BMS archives vary a lot, this tool will try to handle most common cases. But it is not enough, it must be able to detect uncommon cases and bail out when conversion would result in an incorrect archive (e.g. missing sounds).

| Edge cases | Type |
| --- | --- |
| BMS/bmson files in multiple directories | Error |
| Cannot convert wav file to ogg | Error |
| Non-printable characters in file names | Error |
