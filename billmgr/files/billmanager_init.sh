#!/bin/bash

echo "Начальные настройки!"
/usr/local/mgr5/sbin/mgrctl -m billmgr initialsettings.company clicked_button=finish country=182 country_legal=182 country_physical=182 currency=126 doctmpl_envelope=5 doctmpl_invoice=9 doctmpl_payment=4 doctmpl_reconciliation=14 fax_country=182 language=ru locale=3 name="Boss Of The Gym Inc." nextnum_invoice= nextnum_payment= numtmpl_invoice= numtmpl_payment= ogrn= operafake=1576609367306 payment_description= phone="+7 (___) ___-__-__" fax="+7 (___) ___-__-__" phone_country=182 profiletype=2 project_billurl=https://billmanager.docker/billmgr project_name=Gym  project_notifyemail=notify@billmanager.docker project_supportemail=support@billmanager.docker sendcostcurrency=126 sok=ok state_physical=null

# Ждём пока панель просрётся немного
sleep 10

echo "Создаём клиентов..."
/usr/local/mgr5/sbin/mgrctl -m billmgr account.edit clicked_button=ok client_lang=ru confirm="tdnkosugi@gym.jp" country=182 email="tdnkosugi@gym.jp" employee=null notify=off passwd="tdnkosugi@gym.jp" project=1 realname="TDN Kosugi" recovery=off sok=ok state=null
/usr/local/mgr5/sbin/mgrctl -m billmgr account.edit clicked_button=ok client_lang=ru confirm="aniki@gym.jp" country=182 email="aniki@gym.jp" employee=null notify=off passwd="aniki@gym.jp" project=1 realname="Aniki" recovery=off sok=ok state=null

echo "Создаём тип продукта..."
/usr/local/mgr5/sbin/mgrctl -m billmgr itemtype.edit annually=off biennial=off clicked_button=ok closesubtype=0 closetype=0 day=on decennial=off intname=other lifetime=on monthly=on name="Other services" name_ru="Другие услуги" nostopholidays=off orderview=0 progressid=false quadrennial=off quarterly=off quinquennial=off semiannual=off show_addon_image=off sok=ok splitexpense=off transfer=off trial=off trialtype=0 triennial=off

echo "Ждём..."
sleep 30

echo "Создаём дата-центр..."
/usr/local/mgr5/sbin/mgrctl -m billmgr datacenter.edit clicked_button=ok name=Gym name_ru="Качалка" sok=ok

echo "Создаём обработчик..."
/usr/local/mgr5/sbin/mgrctl -m billmgr processing.add.settings clicked_button=finish datacenter=1 module=pmauto name="Зал 1" sok=ok

echo "Создаём тариф..."
/usr/local/mgr5/sbin/mgrctl -m billmgr pricelist.add.step2 access=null activate=on autocalcday=off billdaily=off billhourly=off billprorata=off changepolicy=0 changeprolongpolicy=0 chargestoped=on clicked_button=finish disable_day126=off disable_lifetime126=off disable_monthly126=off intname=fisting itemtype=102 license=null lifetime126=18000.00 minperiodtype=0 name=Fisting name_ru=Fisting nostopholidays=no opennotify=null orderpolicy=0 processingmodule=1 project=1 prolong126=off quickorder=off returnpolicy=0 show_addon_image=no show_on_dashboard=off sok=ok suspendpenaltytype=0

echo "Создаём метод оплаты..."
/usr/local/mgr5/sbin/mgrctl -m billmgr paymethod.add.save account=123 active=on bankname="Gym Bank" clicked_button=finish commissionamount=0 commissionpercent=0 company=1 currency=126 doctmpl=3 hide_prtdesc=on iban=123 minamount=0 module=pmwire name=Pay name_ru="Оплата" orderpriority=1 profiletype="1,2,3" project=1 recipient_name="TDN Kosugi" sok=ok swift=123
