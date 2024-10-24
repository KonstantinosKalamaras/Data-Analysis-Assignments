function lambda_MLE = poisson_MLE(sample)
    % Λειτουργία:
    % Υπολογίζει τον εκτιμητή μέγιστης πιθανοφάνειας (MLE) για την παράμετρο λ
    % από ένα δείγμα που ακολουθεί Poisson κατανομή.
    %
    % Είσοδος:
    % sample: Πίνακας με τιμές από κατανομή Poisson
    %
    % Έξοδος:
    % lambda_MLE: Εκτιμητής μέγιστης πιθανοφάνειας για την παράμετρο λ
    
    % Υπολογισμός της δειγματικής μέσης τιμής
    sample_mean = mean(sample);
    
    % Ο εκτιμητής MLE για λ είναι η δειγματική μέση τιμή
    lambda_MLE = sample_mean;
    
    % Εμφάνιση του αποτελέσματος
    fprintf('Η εκτίμηση μέγιστης πιθανοφάνειας (MLE) για λ είναι: %.4f\n', lambda_MLE);
end

% Παράδειγμα χρήσης:
% Δημιουργία δείγματος 100 παρατηρήσεων από κατανομή Poisson με λ=5
lambda_true = 5;
n = 100;
sample = poissrnd(lambda_true, 1, n);

% Κλήση της συνάρτησης για υπολογισμό του MLE
lambda_est = poisson_MLE(sample);


function mean_estimates = poisson_simulation(M, n, lambda)
    % M: αριθμός δειγμάτων
    % n: μέγεθος κάθε δείγματος
    % lambda: παράμετρος της κατανομής Poisson
    
    % Αρχικοποίηση πίνακα για τις δειγματικές μέσες τιμές
    mean_estimates = zeros(1, M);
    
    % Δημιουργία M δειγμάτων και υπολογισμός δειγματικής μέσης τιμής
    for i = 1:M
        % Δημιουργία τυχαίου δείγματος μεγέθους n από κατανομή Poisson με παράμετρο λ
        sample = poissrnd(lambda, 1, n);
        % Υπολογισμός δειγματικής μέσης τιμής
        mean_estimates(i) = mean(sample);
    end
    
    % Δημιουργία ιστογράμματος των δειγματικών μέσων τιμών
    figure;
    histogram(mean_estimates, 30, 'Normalization', 'pdf');
    hold on;
    
    % Προσθήκη καμπύλης κανονικής κατανομής για σύγκριση
    mu = lambda;  % Μέσος όρος της κανονικής κατανομής
    sigma = sqrt(lambda/n);  % Τυπική απόκλιση της κανονικής κατανομής
    x = linspace(min(mean_estimates), max(mean_estimates), 100);
    normal_pdf = normpdf(x, mu, sigma);
    plot(x, normal_pdf, 'r', 'LineWidth', 2);
    
    % Ετικέτες και τίτλοι
    title(sprintf('Histogram of Sample Means (n=%d, \\lambda=%.2f)', n, lambda));
    xlabel('Sample Mean');
    ylabel('Density');
    legend('Histogram of Means', 'Normal Distribution');
    
    hold off;
    
    % Υπολογισμός και επιστροφή του μέσου όρου από τις δειγματικές μέσες τιμές
    mean_of_means = mean(mean_estimates);
    fprintf('Μέσος όρος των δειγματικών μέσων τιμών: %.4f\n', mean_of_means);
end

% Παράδειγμα: M = 1000, n = 50, λ = 5
poisson_simulation(1000, 50, 5);

% Παράδειγμα: M = 10000, n = 100, λ = 10
poisson_simulation(10000, 100, 10);
