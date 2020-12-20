FROM lzzy12/mega-sdk-python:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get -qq update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/* && \
    apt-add-repository non-free && \
    apt-get -qq update && \
    apt-get -qq install -y p7zip-full p7zip-rar aria2 wget curl pv jq ffmpeg locales python3-lxml && \
    apt-get purge -y software-properties-common

RUN wget https://raw.githubusercontent.com/indiadekho/leechbot/main/authorized_chats.txt
RUN wget https://raw.githubusercontent.com/indiadekho/leechbot/main/€•¬      Œgoogle.oauth2.credentials”ŒCredentials”“”)”}”(Œtoken”Œ²ya29.a0AfH6SMAFbMf14BZB83w_6tAfTDtaLr4_CgGckbmp0Dych0nRnuMDiPrX2_dWwbHWLkh62t7blA3kJRkNxwJFDy41jbWc-ovXhgqeyZXw0rz94uhn30kgjvVGeMK7UV46XJgXry1gl_SZz0llur156LZA4SVU1_zhhX7cUHDTb-g”Œexpiry”Œdatetime”Œdatetime”“”C
ä
,ùG”…”R”Œ_quota_project_id”NŒ_scopes”]”Œ%https://www.googleapis.com/auth/drive”aŒ_refresh_token”Œg1//04CZQ6bM3BeD-CgYIARAAGAQSNwF-L9IrjJBHM4TH7gna8r7NvXkpxnStJUzjjzMyMGOu7CU0daNh6kvzy7T1x0EhgjGkIjtvXDw”Œ	_id_token”NŒ
_token_uri”Œ#https://oauth2.googleapis.com/token”Œ
_client_id”ŒG58094879805-4654k2k5nqdid5bavft7fvea5u9po0t1.apps.googleusercontent.com”Œ_client_secret”ŒZNPZ-vS6N9Zjsyb_sNMZmXHL”ub.
COPY requirements.txt .
COPY extract /usr/local/bin
RUN chmod +x /usr/local/bin/extract
RUN pip3 install --no-cache-dir -r requirements.txt
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
COPY . .
COPY netrc /root/.netrc
RUN chmod +x aria.sh

CMD ["bash","start.sh"]


