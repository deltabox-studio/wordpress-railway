import fs from "node:fs";
import path from "node:path";

const args = process.argv.slice(2);
const clean = args.includes("clean");

for (const folder of ["plugins", "themes", "uploads", "migrate"]) {
  const dirPath = path.join("./data", folder);
  const gitKeepPath = path.join(dirPath, ".gitkeep");
  const dirExists = fs.existsSync(dirPath);
  const gitKeepExists = fs.existsSync(gitKeepPath);

  if (clean) {
    try {
      if (fs.existsSync(dirPath)) {
        fs.rmSync(dirPath, { recursive: true, force: true });
      }
    } catch (error) {
      console.error(`error deleting ${dirPath}:`, error.message);
    }
  }

  try {
    if (dirExists && gitKeepExists) {
      if (!clean) console.log(`directory already exists: ${dirPath}`);
      continue;
    }

    fs.mkdir(dirPath, { recursive: true });
    fs.writeFile(gitKeepPath, " ", { encoding: "utf-8" });

    if (!clean) console.log(`created: ${dirPath}`);
    else console.log(`cleaned: ${dirPath}`);
  } catch (error) {
    if (!clean) console.error(`error creating ${dirPath}:`, error.message);
    else console.error(`error cleaning ${dirPath}:`, error.message);
  }
}
