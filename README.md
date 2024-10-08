# Sam Barham's Emacs Configuration

This repository contains my standard `init.el`, which I use to configure Emacs across various environments. It's intended to make it easier for me to quickly set up Emacs on new machines, particularly when working on remote servers.

I've made the repo public, because I think having ready access to reasonable Emacs configurations is a fine way to help beginners get started developing in Emacs without having to do quite as much legwork. Emacs is big, and complex, and beautiful; but it's perhaps well not to try and delve into *all* of its complexity *all at once*. Best to start somewhere, and then edit and modify as one learns.

## Installation Instructions

### Installing Emacs

Depending on your environment, you can install Emacs in different ways:

#### 1. Without `sudo` Privileges (Using Conda)

If you do not have `sudo` privileges, you can install Emacs using [conda](https://docs.conda.io/en/latest/). First, ensure you have Conda installed, and then use `conda-forge` to install Emacs:

```bash
conda install conda-forge::emacs
```

#### 2. With `sudo` Privileges (Using OS Package Manager)

If you have `sudo` privileges on the machine in question, the easiest way to install Emacs is through your operating system's package manager. For example, on Ubuntu or other Debian-based systems, you might run:

```bash
sudo apt update
sudo apt install emacs
```

You can replace `apt` with the appropriate package manager for your system (e.g., `yum`, `dnf`, or even `brew` for macOS).

## Configuring Emacs

Once you have Emacs installed, you can set it up minimally with the provided `init.el` file from this repository.

### Quick Setup:

1. First clone this repository:

```bash
git clone git@github.com:sbarham/emacs-config.git
```

2. Now copy the `init.el` file to your Emacs configuration directory:

```bash
cp emacs-config/init.el ~/.emacs.d/init.el
```

3. Launch Emacs, and your configuration will automatically be applied.

Enjoy your Emacs setup!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

