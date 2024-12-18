# chatz-action
chatz actions for github workflow it is using `chatz` cli tools.
You can read detail documentation on this repository.

## Requirements
- `PROVIDER` - Provider name should be one of [slack, google, telegram, discord, redis].
- `WEB_HOOK_URL` - Web Hook URL for google/discord.
- `TOKEN` - Token for slack/telegram.
- `CHANNEL_ID` - Target channel id.
- `CHAT_ID` - Target chat id.
- `CONNECTION_URL` - Connection URL for redis.
- `THREAD_ID` - Thread id for reply.
- `MESSAGE` - Message for send.
- `REQUIRED_FAILED` - It will throw exit(1) exception, So, no further steps can be executed. If want to continue execution then don't add this variable.

### Mandatory fields:
- `PROVIDER`
- `MESSAGE`
- `WEB_HOOK_URL` or `TOKEN` or `CONNECTION_URL` any of them is mandatory.


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

