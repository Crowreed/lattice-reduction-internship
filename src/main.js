import { loadTableOfContents } from "/src/components/TableOfContents/TableOfContents.js";
import { createNews } from "/src/components/News/News.js";
import { createProject } from "/src/components/Project/Project.js";

document.addEventListener("DOMContentLoaded", () => {
  loadTableOfContents();
  createProject();
  createNews();
});
