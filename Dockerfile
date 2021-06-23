FROM AftahBagas/Alpha-Userbot:buster

# Alfareza
RUN git clone -b Kanjeng https://github.com/AftahBagas/Kanjeng-Userbot /root/userbot
RUN mkdir /root/userbot/.bin
RUN pip install --upgrade pip setuptools
WORKDIR /root/userbot

#Install python requirements
RUN pip3 install -r https://raw.githubusercontent.com/AftahBagas/Kanjeng-Userbot/Kanjeng/requirements.txt

CMD ["python3","-m","userbot"]
