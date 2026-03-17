# Nura Bahar — PocketBase Backend

## Deploy to Railway (Free)

1. Go to https://railway.app and sign up with GitHub
2. Click **New Project → Deploy from GitHub Repo**
3. Select this backend folder/repo
4. Railway detects the Dockerfile and builds automatically
5. Go to your service → **Settings → Networking → Generate Domain**
6. Copy your live URL e.g. `https://nurabahar-backend.up.railway.app`
7. Paste that URL into your frontend `src/lib/pocketbase.js`

## First-time PocketBase Setup

After Railway deploys, visit:
```
https://your-railway-url.up.railway.app/_/
```
Create your admin account there.

## Collections to Create

### products
| Field         | Type   | Required |
|---------------|--------|----------|
| name          | Text   | Yes      |
| category      | Text   | Yes      |
| price         | Number | Yes      |
| originalPrice | Number | No       |
| description   | Text   | Yes      |
| colors        | JSON   | No       |
| sizes         | JSON   | No       |
| images        | File   | No (multiple) |
| badge         | Text   | No       |
| featured      | Bool   | No       |
| rating        | Number | No       |
| stock         | Number | No       |

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

### reviews
| Field   | Type              |
|---------|-------------------|
| product | Relation→products |
| name    | Text              |
| rating  | Number            |
| comment | Text              |

## Local Development

```bash
# Download pocketbase binary from https://pocketbase.io/docs
chmod +x pocketbase
./pocketbase serve
# Runs at http://127.0.0.1:8090
```
