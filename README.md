## 快速开始

```bash
cd example
cp .env.example .env
vi .env                # 填入 CLOUDFLARE_API_TOKEN
docker-compose up -d
```

Cloudflare Token 在 [API Tokens](https://dash.cloudflare.com/profile/api-tokens) 创建，权限：`Zone → DNS → Edit`。
