# Sử dụng Python làm image cơ bản
FROM python:3.9-slim

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép mã nguồn và các yêu cầu
COPY . /app

# Cài đặt các thư viện cần thiết
RUN pip install -r server-requirements.txt
RUN pip install -r client-requirements.txt

# Mở cổng cho Flask và Streamlit
EXPOSE 5002
EXPOSE 8501

# Chạy cả hai ứng dụng cùng lúc
CMD ["sh", "-c", "python server.py & streamlit run client.py --server.port=8501 --server.address=0.0.0.0"]
