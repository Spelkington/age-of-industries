import sys
import argparse
import json

def main(argv):

    parser = argparse.ArgumentParser()
    parser.add_argument('-p', '--package')
    parser.add_argument('-o', '--output')
    args = parser.parse_args()

    # TODO: Processing
    with open(args.package) as p:
        package_json = json.load(p)

    # Rips the author and email from the package.json formatting
    # of "FULL NAME <yourname@email.com>"
    contact_split = package_json["author"].split("<")
    author = contact_split[0][:-1]
    contact = contact_split[1][:-1]

    output_json = {
        # Retrieve built-in information
        "name": package_json["name"],
        "version": package_json["version"],
        "description": package_json["description"],
        "author": author,
        "contact": contact,

        # Retrieve explicitly defined information
        "homepage": package_json["factorioSettings"]["homepage"],
        "factorio_version": package_json["factorioSettings"]["factorio_version"],
        "dependencies": package_json["factorioSettings"]["dependencies"],
        "title": package_json["factorioSettings"]["title"],
    }

    # Create Factorio mod info file
    with open(args.output, "w") as o:
        o.write(json.dumps(output_json, indent=4))

    with open("./version.txt", "w") as version_file:
        version_file.write(output_json["version"])

    print(f"Factorio output written to {args.output}")

if __name__ == "__main__":
    main(sys.argv)