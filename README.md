# Nura Bahar — PocketBase Backend (Railway)

## Deploy to Railway

### Step 1 — Push this folder to GitHub
Create a new GitHub repo called `nurabahar-backend`.
Push the contents of this folder (Dockerfile, railway.toml, README.md).

```bash
git init
git add .
git commit -m "initial backend setup"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/nurabahar-backend.git
git push -u origin main
```

### Step 2 — Create Railway project
1. Go to https://railway.app
2. Click **New Project → Deploy from GitHub repo**
3. Select `nurabahar-backend`
4. Railway detects the Dockerfile and builds automatically

### Step 3 — Generate a public domain
1. Click your service in Railway
2. Go to **Settings → Networking → Generate Domain**
3. Copy the URL — it looks like:
   ```
   https://nurabahar-backend-production.up.railway.app
   ```

### Step 4 — Add Railway Volume (for persistent data)
1. In Railway, click **New** → **Volume**
2. Attach it to your PocketBase service
3. Set the mount path to `/pb_data`

This ensures your database survives redeploys.

### Step 5 — First-time PocketBase setup
Visit your Railway URL + `/_/`:
```
https://nurabahar-backend-production.up.railway.app/_/
```
Create your admin account and set up collections (see SETUP.md).

---

## Collections to Create

### users (Auth type)
| Field | Type | Notes |
|-------|------|-------|
| name  | Text | User's display name |

### products
| Field         | Type   | Required |
|---------------|--------|----------|
| name          | Text   | Yes |
| category      | Text   | Yes |
| gender        | Text   | No — men/women |
| price         | Number | Yes |
| originalPrice | Number | No |
| description   | Text   | Yes |
| colors        | JSON   | No |
| sizes         | JSON   | No |
| images        | File   | No (multiple) |
| badge         | Text   | No |
| featured      | Bool   | No |
| rating        | Number | No |
| stock         | Number | No |

### orders
| Field        | Type   |
|--------------|--------|
| customerName | Text   |
| email        | Text   |
| phone        | Text   |
| address      | Text   |
| city         | Text   |
| state        | Text   |
| items        | JSON   |
| subtotal     | Number |
| shipping     | Number |
| total        | Number |
| status       | Text   |

---

## Local Development

```bash
# Download PocketBase binary from https://pocketbase.io
chmod +x pocketbase
./pocketbase serve
# Admin UI: http://127.0.0.1:8090/_/
```
