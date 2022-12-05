FROM cirrusci/flutter:3.3.8 as build

RUN apt-get update && \
    apt install -y cmake

WORKDIR /app

# RUN flutter create .
# COPY pubspec.lock pubspec.yaml ./
# COPY lib test fonts images ./
COPY . .
RUN flutter pub get
RUN flutter build apk

FROM nginx:stable-alpine as production-stage
COPY --from=build /app/build/app/outputs/apk/release/app-release.apk /usr/share/nginx/html/iloveu.apk
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]