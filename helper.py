import argparse

parse = argparse.ArgumentParser(description="Edit files license")
parse.add_argument("--license_path",type=str,help="Set path to file license",default="./license")
parse.add_argument("--filename",type=str,help="Name file patching license")
parse.add_argument("--root_folder",type=str,help="Path project folder")
parse.add_argument("--file_owner",type=str,help="Name autor project",default="undefined")
args = parse.parse_args()

word = ["{file}","{project}","{autor}"]
with open(args.license_path) as f:
    s = f.read()
    for i in word:
        if i not in s:
            print("Not found key for replace")
    f.close()
with open("license_tmp","w+") as f:
    s = s.replace(word[0],args.filename)
    s = s.replace(word[1],args.root_folder)
    s = s.replace(word[2],args.file_owner)
    f.write(s)
    f.close()
