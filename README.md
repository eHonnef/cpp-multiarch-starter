# cpp-multiarch-starter

C++ starter project also for cross compiling

## Usage

I'm supposing that you are in the project's root directory.  
To list all presets:

```bash
cmake --list-presets
```

To build using a preset:

```bash
mkdir build && cd build && cmake .. --preset=<your-choice>
make <target>
# example
mkdir build && cd build && cmake .. --preset=linux-gcc-debug
make
# to build the coverage page
cmake .. --preset=linux-gcc-coverage
make coverage
```
