function lambda_MLE = exponential_MLE(sample)
    % Λειτουργία:
    % Υπολογίζει τον εκτιμητή μέγιστης πιθανοφάνειας (MLE) για την παράμετρο λ
    % από ένα δείγμα που ακολουθεί εκθετική κατανομή.
    %
    % Είσοδος:
    % sample: Πίνακας με τιμές από εκθετική κατανομή
    %
    % Έξοδος:
    % lambda_MLE: Εκτιμητής μέγιστης πιθανοφάνειας για την παράμετρο λ
    
    % Υπολογισμός της δειγματικής μέσης τιμής
    sample_mean = mean(sample);
    
    % Εκτιμητής MLE για λ είναι το αντίστροφο της δειγματικής μέσης τιμής
    lambda_MLE = 1 / sample_mean;
    
    % Εμφάνιση αποτελέσματος
    fprintf('Η εκτίμηση μέγιστης πιθανοφάνειας (MLE) για λ είναι: %.4f\n', lambda_MLE);
end

% Παράδειγμα χρήσης:
% Δημιουργία δείγματος 100 παρατηρήσεων από εκθετική κατανομή με λ=2
lambda_true = 2;
n = 100;
sample = exprnd(1/lambda_true, [1, n]);

% Κλήση της συνάρτησης για υπολογισμό του MLE
lambda_est = exponential_MLE(sample);



function lambda_estimates = exponential_simulation(M, n, lambda)
    % M: αριθμός δειγμάτων
    % n: μέγεθος κάθε δείγματος
    % lambda: παράμετρος της εκθετικής κατανομής
    
    % Αρχικοποίηση πίνακα για τους εκτιμητές της παραμέτρου λ
    lambda_estimates = zeros(1, M);
    
    % Δημιουργία M δειγμάτων και υπολογισμός εκτιμητή για κάθε δείγμα
    for i = 1:M
        % Δημιουργία τυχαίου δείγματος μεγέθους n από εκθετική κατανομή
        sample = exprnd(1/lambda, 1, n);
        % Υπολογισμός της δειγματικής μέσης τιμής
        sample_mean = mean(sample);
        % Εκτιμητής μέγιστης πιθανοφάνειας για λ είναι το αντίστροφο της μέσης τιμής
        lambda_estimates(i) = 1 / sample_mean;
    end
    
    % Δημιουργία ιστογράμματος των εκτιμήσεων για λ
    figure;
    histogram(lambda_estimates, 30, 'Normalization', 'pdf');
    hold on;
    
    % Προσθήκη καμπύλης κανονικής κατανομής για σύγκριση
    mu = lambda;  % Μέσος όρος της κατανομής των εκτιμητών (πρέπει να είναι κοντά στο πραγματικό λ)
    sigma = lambda / sqrt(n);  % Τυπική απόκλιση της κατανομής των εκτιμητών
    x = linspace(min(lambda_estimates), max(lambda_estimates), 100);
    normal_pdf = normpdf(x, mu, sigma);
    plot(x, normal_pdf, 'r', 'LineWidth', 2);
    
    % Ετικέτες και τίτλοι
    title(sprintf('Histogram of MLE Estimates of \\lambda (n=%d, \\lambda=%.2f)', n, lambda));
    xlabel('MLE Estimate of \\lambda');
    ylabel('Density');
    legend('Histogram of Estimates', 'Normal Distribution');
    
    hold off;
    
    % Υπολογισμός και εκτύπωση του μέσου όρου των εκτιμήσεων
    mean_of_estimates = mean(lambda_estimates);
    fprintf('Μέσος όρος των εκτιμήσεων: %.4f\n', mean_of_estimates);
end

% Παράδειγμα: M = 1000, n = 50, λ = 2
exponential_simulation(1000, 50, 2);

% Παράδειγμα: M = 5000, n = 100, λ = 3
exponential_simulation(5000, 100, 3);
