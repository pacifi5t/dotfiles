#! python3

import os
from sys import platform

home = os.environ["HOME"]
excluded_files = [".DS_Store"]


def print_symlink(file_path: str, symlink_path: str):
    print(
        f"┌── {symlink_path.replace(home, '~')}\n"
        f"└─> {file_path.replace(home, '~')}\n"
    )


def create_symlink(file_path: str, symlink_path: str):
    try:
        os.remove(symlink_path)
    except FileNotFoundError:
        pass
    os.symlink(file_path, symlink_path)
    print_symlink(file_path, symlink_path)


def list_files_to_symlinks(directory: str) -> list[tuple[str, str]]:
    file_symlink_tuples = []

    for root, _, files in os.walk(directory):
        for file in files:
            if file in excluded_files:
                continue

            file_path = os.path.join(root, file)
            symlink_path = os.path.join(
                home, os.path.relpath(file_path, directory)
            )

            file_symlink_tuples.append((file_path, symlink_path))

    return file_symlink_tuples


def main():
    dotfiles_home = os.environ.get("DOTFILES_HOME")
    if dotfiles_home is None:
        dotfiles_home = os.path.join(home, ".local/share/dotfiles")
        print(
            "'DOTFILES_HOME' variable is undefined, assuming the path to "
            f"dotfiles is {dotfiles_home.replace(home, '~')}\n"
        )

    common_dir = os.path.join(dotfiles_home, "common")
    file_symlink_tuples = list_files_to_symlinks(common_dir)
    if platform == "linux":
        linux_dir = os.path.join(dotfiles_home, "linux")
        file_symlink_tuples += list_files_to_symlinks(linux_dir)
    elif platform == "darwin":
        macos_dir = os.path.join(dotfiles_home, "macos")
        file_symlink_tuples += list_files_to_symlinks(macos_dir)

    for file_path, symlink_path in file_symlink_tuples:
        os.makedirs(os.path.dirname(symlink_path), exist_ok=True)
        create_symlink(file_path, symlink_path)


if __name__ == "__main__":
    main()
