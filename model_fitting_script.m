kMaxOrder = 2;

kData = [3.8686992545234347, 1.3559682753431659; ...
        0.5180993375153686, 5.117486709676035; ...
        3.5386436080165806, 1.5271125008781592; ...
        4.728401339990676, 1.114753166423772; ...
        9.023721046916886, 4.338066212680383; ...
        0.01162719298319903, 6.076772652356936; ...
        5.991635210658819, 1.2966680782036724; ...
        6.065836085221114, 1.3272013121118933; ...
        8.116481067645926, 3.0424908489990976; ...
        3.4596129148699015, 1.5745584744071195; ...
        3.311476661626893, 1.6702222128461326; ...
        5.877037623043535, 1.2538389984467715; ...
        1.292978422219696, 3.8484017956257546; ...
        4.721539277238149, 1.11550807482421; ...
        8.506311207767968, 3.5588436571438553; ...
        0.6057636006285494, 4.961862706712194; ...
        7.104743838802512, 1.985989325395428; ...
        4.479413884955205, 1.1542019806354862; ...
        3.0128605724511037, 1.8897446209038709; ...
        1.9357873494944466, 2.9778798335036534];

% plot(kData(:, 1), kData(:, 2), 'o');

% Form an alternant matrix.
orders = [kMaxOrder:-1:0];
alternant = zeros(size(kData, 1), numel(orders));
for j = 1:numel(orders)
  alternant(:, j) = kData(:, 1).^orders(j);
end

% Solve for the fitted coefficients.
beta = alternant \ kData(:, 2);

% Use the model to estimate depedendent values.
y_estimated = polyval(beta, kData(:, 1));
plot(kData(:, 1), kData(:, 2), 'o', kData(:, 1), y_estimated, 'x');