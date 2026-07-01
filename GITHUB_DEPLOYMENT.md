# UrbanFlow GitHub Pages Deployment

This folder is ready to push directly to GitHub Pages.

## Public URL Format

After deployment, the final website will be available at:

```text
https://YOUR-GITHUB-USERNAME.github.io/YOUR-REPOSITORY-NAME/
```

The dashboard page will be:

```text
https://YOUR-GITHUB-USERNAME.github.io/YOUR-REPOSITORY-NAME/dashboard.html
```

## Push Commands

Run these commands from inside the `urbanflow_website` folder:

```bash
git init
git add .
git commit -m "Deploy UrbanFlow Bengaluru analytics website"
git branch -M main
git remote add origin https://github.com/YOUR-GITHUB-USERNAME/YOUR-REPOSITORY-NAME.git
git push -u origin main
```

## Enable GitHub Pages

1. Open the GitHub repository.
2. Go to **Settings**.
3. Go to **Pages**.
4. Under **Build and deployment**, select:
   - Source: `Deploy from a branch`
   - Branch: `main`
   - Folder: `/root`
5. Click **Save**.
6. Wait 1–2 minutes and open the generated link.

## Final Output Pages

- `index.html` — eye-catching portfolio website
- `dashboard.html` — interactive analytics dashboard

## Notes

The project includes a complete dashboard build kit:

- `powerbi/UrbanFlow_Theme.json`
- `powerbi/UrbanFlow_DAX_Measures.dax`
- `powerbi/PowerBI_Build_Instructions.md`

The browser dashboard is ready for presentation on mobile, tablet, and laptop.
