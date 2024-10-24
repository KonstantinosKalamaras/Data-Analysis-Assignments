% Παράμετροι
lambda = 1/15;    % Παράμετρος εκθετικής κατανομής (λ)
true_mean = 1/lambda;  % Πραγματικός μέσος χρόνος ζωής (15 μήνες)
M = 1000;        % Αριθμός δειγμάτων
n_a = 5;     % Μέγεθος δείγματος για την περίπτωση (α)
n_b = 100;   % Μέγεθος δείγματος για την περίπτωση (β)
alpha = 0.05;    % Επίπεδο σημαντικότητας για 95% διάστημα εμπιστοσύνης

% Α. Προσομοίωση με n = 5
inside_CI_small = 0;
for i = 1:M
    sample = exprnd(1/lambda, n_a, 1);   % n = 5 τυχαίες τιμές από εκθετική κατανομή
    [~, ~, ci] = ttest(sample, true_mean, 'Alpha', alpha);  % Διάστημα εμπιστοσύνης
    if ci(1) <= true_mean && ci(2) >= true_mean  % Έλεγχος αν ο πραγματικός μέσος βρίσκεται στο διάστημα εμπιστοσύνης
        inside_CI_small = inside_CI_small + 1;
    end
end

% Ποσοστό εμφάνισης του πραγματικού μέσου μέσα στο διάστημα εμπιστοσύνης
percent_inside_CI_small = (inside_CI_small / M) * 100;
fprintf('Ποσοστό με n = 5: %.2f%%\n', percent_inside_CI_small);

% Β. Προσομοίωση με n = 100
inside_CI_large = 0;
for i = 1:M
    sample = exprnd(1/lambda, n_b, 1);   % n = 100 τυχαίες τιμές από εκθετική κατανομή
    [~, ~, ci] = ttest(sample, true_mean, 'Alpha', alpha);  % Διάστημα εμπιστοσύνης
    if ci(1) <= true_mean && ci(2) >= true_mean  % Έλεγχος αν ο πραγματικός μέσος βρίσκεται στο διάστημα εμπιστοσύνης
        inside_CI_large = inside_CI_large + 1;
    end
end

% Ποσοστό εμφάνισης του πραγματικού μέσου μέσα στο διάστημα εμπιστοσύνης
percent_inside_CI_large = (inside_CI_large / M) * 100;
fprintf('Ποσοστό με n = 100: %.2f%%\n', percent_inside_CI_large);
