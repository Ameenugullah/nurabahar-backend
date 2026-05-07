# Nura Bahar — PocketBase Backend (Render)

PocketBase served via Docker on Render with a persistent disk.

---

## Deploy to Render

### Step 1 — Push to GitHub

```bash
git init
git add .
git commit -m "switch backend to Render"
git branch -M main
git remote add origin https://github.com/Ameenugullah/nurabahar-backend.git
git push -u origin main
```

### Step 2 — Create Render Web Service

1. Go to <https://render.com>
2. Click **New → Web Service**
3. Connect your GitHub repo → select `nurabahar-backend`
4. Render detects `render.yaml` automatically
5. Choose **Free** plan
6. Click **Deploy**

### Step 3 — Your backend URL

Once deployed, your backend will be live at:

```text
https://nurabahar-backend.onrender.com
```

Copy this URL and paste it into your **frontend** Render service environment variable:

```text
VITE_PB_URL = https://nurabahar-backend.onrender.com
```

### Step 4 — First-time PocketBase setup

Visit your backend URL + `/_/`:

```text
https://nurabahar-backend.onrender.com/_/
```

Create your admin account, then set up the collections below.

---

## Collections to Create

### products

| Field         | Type   | Required |
|---------------|--------|----------|
| name          | Text   | Yes      |
| category      | Text   | Yes      |
| gender        | Text   | No       |
| price         | Number | Yes      |
| originalPrice | Number | No       |
| description   | Text   | Yes      |
| colors        | JSON   | No       |
| sizes         | JSON   | No       |
| images        | File   | No       |
| badge         | Text   | No       |
| featured      | Bool   | No       |
| rating        | Number | No       |
| stock         | Number | No       |
| created       | Auto   | Auto     |

### orders

| Field         | Type   | Required |
|---------------|--------|----------|
| customerName  | Text   | Yes      |
| email         | Text   | Yes      |
| phone         | Text   | Yes      |
| address       | Text   | Yes      |
| city          | Text   | Yes      |
| state         | Text   | Yes      |
| items         | JSON   | Yes      |
| subtotal      | Number | Yes      |
| shipping      | Number | Yes      |
| total         | Number | Yes      |
| status        | Text   | Yes      |
| paymentRef    | Text   | No       |
| paymentStatus | Text   | No       |

**API Rules for orders:**

- List/View: leave empty (admin only)
- Create: `""` (allow anyone — needed for checkout)

---

## Local Development

```bash
# Download PocketBase binary from https://pocketbase.io/docs
chmod +x pocketbase
./pocketbase serve
# Admin UI → http://127.0.0.1:8090/_/
```

---

## ⚠️ Important: Free Tier Sleep

Render free services sleep after 15 minutes of inactivity.
The first request after sleeping takes ~30 seconds.
Upgrade to the **Starter plan ($7/mo)** to keep it always on