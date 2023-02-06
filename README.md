# Домашнее задание #4
## Развернуть в кластере две версии приложения и настроить балансировку трафика между ними

## Установка компонентов
### Установить istioctl.
### Добавить необходимые репозитории в Helm:

### Istio
Установить Istio:
```
istioctl install --set profile=demo -y
kubectl label namespace default istio-injection=enabled
```

### Application
Установить приложение
```
helm upgrade --install crudapp .\crud-chart
```
### Проверка
```
kubectl get all --namespace default
```
![CRUDAPP](screenshot2.png)

### Istio Services
Установить объекты Istio
```
kubectl apply -f .\istio\istio.yaml
```
Проверить, что все ок
```
istioctl analyze
```
### Kiali
Установить Kiali:
```
kubectl apply -f kiali
kubectl rollout status deployment/kiali -n istio-system
```
### Протестировать
Открыть сервис в браузере через istio-ingressgateway:
```
minikube -n istio-system service istio-ingressgateway
```
![ISTIOSYS](screenshot3.png)

Создадим пользователя (id = 1)
```
Отправляем запрос put на <servicehost>/user
```
![](screenshot4.png)

Оправляем запросы на получение
```
Отправляем запросы get на <servicehost>/user?userId=1
```
![](screenshot5.png)

Граф в Kiali
```
istioctl dashboard kiali
```
### Карта сервисов
![Map](screenshot.png)
