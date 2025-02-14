import tsParser from '@typescript-eslint/parser';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import js from '@eslint/js';
import { FlatCompat } from '@eslint/eslintrc';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const compat = new FlatCompat({
  baseDirectory: __dirname,
  recommendedConfig: js.configs.recommended,
  allConfig: js.configs.all,
});

const eslintConfig = [
  ...compat.extends('plugin:@typescript-eslint/recommended'),
  {
    languageOptions: {
      parser: tsParser,
      ecmaVersion: 2022,
      sourceType: 'module',
    },
    files: ['**/*.ts'],
    rules: {
      '@typescript-eslint/explicit-member-accessibility': 0,
      '@typescript-eslint/explicit-function-return-type': 0,
      '@typescript-eslint/no-parameter-properties': 0,
      '@typescript-eslint/interface-name-prefix': 0,
    },
    ignores: ['node_modules', 'build', '.gitignore'],
  },
];

export default eslintConfig;
