### `main.ahk`

Daily [AutoHotKey](https://www.autohotkey.com/) shortcut keys.

### compress_pdf.bat

Compress PDFs in a folder using GhostScript (Windows version).

You must install [GhostScript](https://www.ghostscript.com/releases/gsdnld.html)
and make sure it can be found by the Shell, e.g. the `bin/` directory of GhostScript must 
be in the PATH variable. If not, you might modify the GS variable to the path to the `gswin64c.exe`, 
which is the commandline interface of GhostScript on Windows.

### af3_json_generate.py 

Generate JSON file for batch submission of AF3 jobs.

Run `python af3_json_generate.py -h` to show the help message.

#### Example

```bash
python af3_json_generate.py example my_job
```

#### Folder Structure

This script requires a specific folder structure to run correctly.

Here is the structure of the example folder.

```
EXAMPLE\
├─protein_a\
├─protein_b\
└─protein_c\
```

* `EXAMPLE` is should be the `root_dir` parameter of script.
* `protein_a`, `protein_b`, `protein_c` is the name of the protein (or protein complex).
* Inside `protien_x` folder, is the `.fasta` file stores the sequence of each chain of the protein.
  **Every `.fasta` file must contain the sequence of exactly ONE protein chain**.
