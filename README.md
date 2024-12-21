# chatz-action
chatz actions for github workflow it is using `chatz` cli tools.
You can read detail documentation on this repository.

## Requirements
As required fields are `PROVIDER` and `MESSAGE`, others field will be mandatory based on `PROVIDER`.

### Supported list of Provider
  - `slack`
    - Required Fields: [`PROVIDER`, `TOKEN`, `CHANNEL_ID`]
    - [Read documentation](https://github.com/tech-thinker/chatz/blob/main/docs/slack.md)
  - `google`
    - Required Fields: [`PROVIDER`, `WEB_HOOK_URL`]
    - [Read documentation](https://github.com/tech-thinker/chatz/blob/main/docs/google.md)
  - `telegram`
    - Required Fields: [`PROVIDER`, `TOKEN`, `CHAT_ID`]
    - [Read documentation](https://github.com/tech-thinker/chatz/blob/main/docs/telegram.md)
  - `discord`
    - Required Fields: [`PROVIDER`, `WEB_HOOK_URL`]
    - [Read documentation](https://github.com/tech-thinker/chatz/blob/main/docs/discord.md)
  - `redis`
    - Required Fields: [`PROVIDER`, `CONNECTION_URL`, `CHANNEL_ID`]
    - [Read documentation](https://github.com/tech-thinker/chatz/blob/main/docs/redis.md)
  - `smtp`
    - Required Fields: [`PROVIDER`, `SMTP_HOST`, `SMTP_PORT`, `SMTP_USE_TLS`,`SMTP_USE_STARTTLS`,`SMTP_USER`,`SMTP_PASSWORD`,`SMTP_SUBJECT`,`SMTP_FROM`,`SMTP_TO`]
    - [Read documentation](https://github.com/tech-thinker/chatz/blob/main/docs/smtp.md)

### List of Fields
- `PROVIDER`
  - Type: string
  - Provider name should be from supported Provider list.
- `WEB_HOOK_URL`
  - Type: string
  - Web Hook URL for google/discord.
- `TOKEN`
  - Type: string
  - Token for slack/telegram.
- `CHANNEL_ID`
  - Type: string
  - Target channel id.
- `CHAT_ID`
  - Type: string
  - Target chat id.
- `CONNECTION_URL`
  - Type: string
  - Connection URL for redis.
- `THREAD_ID`
  - Type: string
  - Thread id for reply.
- `MESSAGE`
  - Type: string
  - Message for send.
- `REQUIRED_FAILED`
  - Type: boolean
  - It will throw exit(1) exception, So, no further steps can be executed. If want to continue execution then don't add this variable.
- `SMTP_HOST`
  - Type: string
  - SMTP server host.
- `SMTP_PORT`
  - Type: integer
  - SMTP server port.
- `SMTP_USE_TLS`
  - Type: boolean
  - If you want to enable TLS. (Example port is: 465)
- `SMTP_USE_STARTTLS`
  - Type: boolean
  - If you want to enable STARTTLS. (Example port is: 587)
- `SMTP_USER`
  - Type: string
  - SMTP server login user.
- `SMTP_PASSWORD`
  - Type: string
  - SMTP server login password.
- `SMTP_SUBJECT`
  - Type: string
  - Email subject.
- `SMTP_FROM`
  - Type: string
  - Email from address.
- `SMTP_TO`
  - Type: string
  - Email recipient address. (It can be comma sapareted for multiple.)

## How to get this required details?
To get this required details, go to [chatz](https://github.com/tech-thinker/chatz) and read documentation there.

## Usage
```yaml
- name: chatz action
  uses: tech-thinker/chatz-action@<version-tag>
  with:
    PROVIDER: "google"
    WEB_HOOK_URL: "${{ secrets.WEB_HOOK_URL }}"
    MESSAGE: ${{ github.event.inputs.message }}
```

- For failure response

```yaml
- name: chatz action
  if: ${{ failure() }}
  uses: tech-thinker/chatz-action@<version-tag>
  with:
    PROVIDER: "google"
    WEB_HOOK_URL: "${{ secrets.WEB_HOOK_URL }}"
    MESSAGE: ${{ github.event.inputs.message }}
    REQUIRED_FAILED: "true"
```
