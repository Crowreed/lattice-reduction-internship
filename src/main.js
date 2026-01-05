import { loadTableOfContents } from "./components/TableOfContents/TableOfContents.js";
import { createNews } from "./components/News/News.js";
import { createProject } from "./components/Project/Project.js";
import { makeArticle } from "./components/Course/Course.js";
import { loadFooter } from "./components/Footer/footer.js";
import { setupKatex } from "./katex-config.js";

document.addEventListener("DOMContentLoaded", () => {
  loadTableOfContents();
  createProject();
  createNews();
  makeArticle();
  setupKatex();
  loadFooter();
});
