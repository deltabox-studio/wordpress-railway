import fs from "node:fs";
import path from "node:path";

for (const folder of ["plugins", "themes", "uploads", "migrate"]) {
  const dirPath = path.join("./data", folder);
  const gitKeepPath = path.join(dirPath, ".gitkeep");
  const dirExists = fs.existsSync(dirPath);
  const gitKeepExists = fs.existsSync(gitKeepPath);

  try {
    if (dirExists && gitKeepExists) {
      console.log(`directory already exists: ${dirPath}`);
      continue;
    }

    fs.mkdir(dirPath, { recursive: true });
    fs.writeFile(gitKeepPath, " ", { encoding: "utf-8" });

    console.log(`created: ${dirPath}`);
  } catch (error) {
    console.error(`error creating ${dirPath}:`, error.message);
  }
}
