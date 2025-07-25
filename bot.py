from pyrogram import Client, idle
from pyromod import listen
from casery import caes, casery, group, source, photosource, caserid, ch, bot_token, bot_token2

bot = Client("CAR", api_id=23873818, api_hash="0fb82e50665a5406979304c7fce10a6f", bot_token=bot_token, plugins=dict(root="CASER"))
lolo = Client("hossam", api_id=23873818, api_hash="0fb82e50665a5406979304c7fce10a6f", session_string=bot_token2)    

DEVS = caes
DEVSs = []
bot_id = bot.bot_token.split(":")[0]

async def start_zombiebot():
    print("تم تشغيل الصانع بنجاح..💗")
    await bot.start()
    await lolo.start()
    try:
      await bot.send_message(casery, "**تم تشغيل الصانع بنجاح..💗**")
    except:
      pass
    await idle()
