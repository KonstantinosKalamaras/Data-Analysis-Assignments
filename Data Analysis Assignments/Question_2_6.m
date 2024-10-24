% Αριθμός επαναλήψεων και δείγματα
n = 100;        % Μέγεθος δείγματος (n = 100 τυχαίες μεταβλητές)
N = 10000;      % Αριθμός τιμών της Y (επαναλήψεις)

% Προσομοίωση: N τιμές μέσου όρου από n ομοιόμορφες μεταβλητές
Y_values = zeros(1, N);  % Πίνακας για τις μέσες τιμές

for i = 1:N
    X = rand(n, 1);      % n τυχαίες τιμές από U[0, 1]
    Y_values(i) = mean(X);  % Μέση τιμή
end

% Ιστόγραμμα των τιμών Y
figure;
histogram(Y_values, 30, 'Normalization', 'pdf');
hold on;

% Θεωρητική κανονική κατανομή σύμφωνα με το ΚΟΘ
mu = 0.5;                 % Μέσος όρος της ομοιόμορφης U[0, 1]
sigma = 1 / sqrt(12 * n);  % Τυπική απόκλιση για το δείγμα
x = linspace(min(Y_values), max(Y_values), 100);
normal_pdf = normpdf(x, mu, sigma);
plot(x, normal_pdf, 'r', 'LineWidth', 2);  % Καμπύλη της κανονικής κατανομής

% Ετικέτες και τίτλοι
title('Histogram of Sample Means (Y) and Normal Distribution');
xlabel('Y values');
ylabel('Probability Density');
legend('Histogram of Y', 'Normal Distribution');
hold off;
