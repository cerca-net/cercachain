import yaml from 'js-yaml';
import fs from 'fs';

/**
 * Parses a YAML file and returns its content as a JavaScript object.
 * @param {string} filePath - The path to the YAML file.
 * @returns {Object|null} - The parsed YAML content or null if an error occurs.
 */
const parseYaml = (filePath) => {
  try {
    const fileContents = fs.readFileSync(filePath, 'utf8');
    return yaml.load(fileContents);
  } catch (error) {
    console.error(`Error parsing YAML file ${filePath}:`, error);
    return null;
  }
};

export default parseYaml;