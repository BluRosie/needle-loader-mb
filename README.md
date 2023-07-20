This repository builds one of the Animal Crossing Multiboot images which comes compressed within the GameCube Animal Crossing entry. This is done to assist in [the decompilation of the overall game](https://github.com/Prakxo/ac-decomp/).

Requires agbcc.  Need to install it like the Pokémon Decompilations, i.e.:

```
git clone https://github.com/pret/agbcc.git
cd agbcc
./build.sh
./install.sh path/to/needle-loader-mb
```

It builds the following image:

    17c51081033a7d5381cf611a609801356ca456c6  needle-loader-mb.gba
