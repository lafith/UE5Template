import os
import argparse


TMP = "TemplateProject"

def edit_file(path):
	file = open(path, "r")
	lines = file.readlines()

	for i, line in enumerate(lines):
		if TMP in line:
			lines[i] = line.replace(TMP, PROJ)

	file = open(path, "w")
	file.writelines(lines)
	file.close()

if __name__ == "__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument('--name', type=str, required=True)
	args = parser.parse_args()
	PROJ = args.name	

	print("Renaming Folders and files...")
	os.rename(TMP, PROJ)
	os.rename(
		os.path.join(PROJ, TMP+".uproject"),
		os.path.join(PROJ, PROJ+".uproject")
		)
	os.rename(
		os.path.join(PROJ, "Source", TMP+"Core"),
		os.path.join(PROJ, "Source", PROJ+"Core")
		)
	os.rename(
		os.path.join(PROJ, "Source", TMP+".Target.cs"),
		os.path.join(PROJ, "Source", PROJ+".Target.cs")
		)
	os.rename(
		os.path.join(PROJ, "Source", TMP+"Editor.Target.cs"),
		os.path.join(PROJ, "Source", PROJ+"Editor.Target.cs")
		)
	os.rename(
		os.path.join(PROJ, "Source", PROJ+"Core", TMP+"Core.Build.cs"),
		os.path.join(PROJ, "Source", PROJ+"Core", PROJ+"Core.Build.cs"))
	os.rename(
		os.path.join(PROJ, "Source", PROJ+"Core", "Public", TMP+"Core.h"),
		os.path.join(PROJ, "Source", PROJ+"Core", "Public", PROJ+"Core.h"))
	os.rename(
		os.path.join(PROJ, "Source", PROJ+"Core", "Private", TMP+"Core.cpp"),
		os.path.join(PROJ, "Source", PROJ+"Core", "Private", PROJ+"Core.cpp"))

	print("Editing files")
	edit_file(os.path.join(PROJ, PROJ+".uproject"))
	edit_file(os.path.join(PROJ,"Source", PROJ+".Target.cs"))
	edit_file(os.path.join(PROJ, "Source", PROJ+"Editor.Target.cs"))
	edit_file(os.path.join(PROJ, "Source", PROJ+"Core", PROJ+"Core.Build.cs"))
	edit_file(os.path.join(PROJ, "Source", PROJ+"Core", "Public", PROJ+"Core.h"))
	edit_file(os.path.join(PROJ, "Source", PROJ+"Core", "Private", PROJ+"Core.cpp"))
	edit_file(os.path.join(PROJ, "Source", PROJ+"Core", "Private", "Log.cpp"))
	edit_file(os.path.join(PROJ, "Source", PROJ+"Core", "Private", "Log.h"))
	print("All Done!")