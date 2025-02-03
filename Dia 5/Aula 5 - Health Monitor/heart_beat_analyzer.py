import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import find_peaks

# String inicial com dados numéricos separados por ponto e vírgula
DATA_STRING = "78571;78587;78507;78447;78482;78509;78513;78516;78552;78555;78564;78574;78584;78565;78440;78453;78479;78499;78501;78526;78545;78559;78564;78576;78583;78586;78510;78446;78463;78479;78490;78504;78534;78541;78557;78566;78575;78578;78563;78457;78487;78503;78526;78529;78542;78558;78560;78565;78563;78570;78575;78497;78454;78494;78511;78508;78522;78535;78546;78561;78562;78567;78565;78396;78364;78400;78444;78451;78466;78480;78488;78484;78489;78496;78421;78321;78376;78401;78406;78417;78437;78462;78484;78478;78491;78484;78365;78331;78364;78413;78436;78455;78490;78499;78499;78497;78498;78455;78323;78351;78386;78406;78417;78436;78462;78488;78502;78504;78517;78547;78397;78404;78421;78462;78485;78511;78542;78566;78580;78594;78603;78621;78605;78487;78531;78567;78586;78598;78602;78585;78608;78637;78643;78636;78612;78592;78428;78420;78440;78469;78469;78474;78510;78538;78556;78560;78564;78568;78460;78429;78466;78485;78480;78478;78498;78515;78513;78519;78515;78486;78374;78420;"

# Duração da janela de coleta em segundos
DURATION_IN_SECONDS = 10  # Por exemplo, 10 segundos

# Remova ";" das extremidades da string
DATA_STRING = DATA_STRING.strip(';')

# Converte a string para uma lista de números
data_list = list(map(int, DATA_STRING.split(';')))

# Calcula a taxa de coleta em Hz com base na duração e no número de amostras
number_of_samples = len(data_list)
sampling_rate = number_of_samples / DURATION_IN_SECONDS

# Plota os dados em um gráfico de linhas
plt.figure(figsize=(10, 5))
plt.plot(data_list, label='Dados brutos')
plt.title('Curva de Batimentos Cardíacos')
plt.xlabel('Amostras')
plt.ylabel('Intensidade')
plt.legend()
plt.show()

# Calcula os picos usando scipy
peaks, _ = find_peaks(data_list, distance=sampling_rate/2)  # O argumento 'distance' evita detecção de picos muito próximos

# Plota os dados com os picos indicados
plt.figure(figsize=(10, 5))
plt.plot(data_list, label='Dados brutos')
plt.plot(peaks, np.array(data_list)[peaks], "x", label='Picos', markersize=10, mew=2)
plt.title('Curva de Batimentos Cardíacos com Picos')
plt.xlabel('Amostras')
plt.ylabel('Intensidade')
plt.legend()
plt.show()

# Calcula a frequência dos picos
peak_intervals = np.diff(peaks)  # Diferença entre índices dos picos
peak_intervals_in_seconds = peak_intervals / sampling_rate  # Converte intervalos para segundos
heart_rates = 60 / peak_intervals_in_seconds  # Calcula batimentos por minuto
# Calcula a média das frequências dos picos
average_heart_rate = np.mean(heart_rates)

# Mostra os resultados
print("Índices dos picos:", peaks)
print("Intervalos entre picos (em amostras):", peak_intervals)
print("Intervalos entre picos (em segundos):", peak_intervals_in_seconds)
print("Frequências dos picos (BPM):", heart_rates)

# Plota a frequência dos picos
plt.figure(figsize=(10, 5))
plt.plot(heart_rates, marker='o', linestyle='-', label='Frequência dos Picos (BPM)')
plt.axhline(y=average_heart_rate, color='r', linestyle='--', label='Média dos Batimentos Cardíacos')
plt.title('Frequência dos Picos de Batimentos Cardíacos')
plt.xlabel('Número do Pico')
plt.ylabel('Frequência (BPM)')
plt.legend()
plt.show()
