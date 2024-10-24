% Αρχικοποίηση
n_values = [100, 1000, 10000, 100000];  % Διαφορετικά μεγέθη επαναλήψεων
means_EinvX_12 = zeros(size(n_values));  % Για E[1/X] όταν X ~ U[1,2]
means_invEX_12 = zeros(size(n_values));  % Για 1/E[X] όταν X ~ U[1,2]

means_EinvX_01 = zeros(size(n_values));  % Για E[1/X] όταν X ~ U[0,1]
means_invEX_01 = zeros(size(n_values));  % Για 1/E[X] όταν X ~ U[0,1]

means_EinvX_m11 = zeros(size(n_values)); % Για E[1/X] όταν X ~ U[-1,1]
means_invEX_m11 = zeros(size(n_values)); % Για 1/E[X] όταν X ~ U[-1,1]

% Λούπα για κάθε μέγεθος n
for i = 1:length(n_values)
    n = n_values(i);
    
    % Για κατανομή U[1, 2]
    X_12 = rand(n,1) * (2 - 1) + 1;  % Ομοιόμορφη U[1, 2]
    means_EinvX_12(i) = mean(1 ./ X_12);
    means_invEX_12(i) = 1 / mean(X_12);
    
    % Για κατανομή U[0, 1]
    X_01 = rand(n,1);  % Ομοιόμορφη U[0, 1]
    means_EinvX_01(i) = mean(1 ./ X_01);
    means_invEX_01(i) = 1 / mean(X_01);
    
    % Για κατανομή U[-1, 1]
    X_m11 = rand(n,1) * 2 - 1;  % Ομοιόμορφη U[-1, 1]
    means_EinvX_m11(i) = mean(1 ./ X_m11);
    means_invEX_m11(i) = 1 / mean(X_m11);
end

% Γραφικές παραστάσεις
figure;
subplot(3,1,1);
plot(n_values, means_EinvX_12, '-o', 'DisplayName', 'E[1/X]');
hold on;
plot(n_values, means_invEX_12, '-x', 'DisplayName', '1/E[X]');
title('Uniform Distribution on [1, 2]');
xlabel('Number of samples (n)');
ylabel('Values');
legend;
hold off;

subplot(3,1,2);
plot(n_values, means_EinvX_01, '-o', 'DisplayName', 'E[1/X]');
hold on;
plot(n_values, means_invEX_01, '-x', 'DisplayName', '1/E[X]');
title('Uniform Distribution on [0, 1]');
xlabel('Number of samples (n)');
ylabel('Values');
legend;
hold off;

subplot(3,1,3);
plot(n_values, means_EinvX_m11, '-o', 'DisplayName', 'E[1/X]');
hold on;
plot(n_values, means_invEX_m11, '-x', 'DisplayName', '1/E[X]');
title('Uniform Distribution on [-1, 1]');
xlabel('Number of samples (n)');
ylabel('Values');
legend;
hold off;
