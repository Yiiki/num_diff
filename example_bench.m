% time vector
test=linspace(0,2.*pi,2001);
% f value, which is periodic
fest=exp(cos(test).*sin(2.*test));
% noisy signal
fest_noise=fest+0.01.*randn(size(fest));

sig=8e-3.*2.*pi;
% sig=80e-3;

yinq=test;

% arrayfun can be accelerated by gpu, or can be substituted with parfor
tinq_vec=test;% tinq_vec is not necessarily as test, here is just a example

% to minimized the boundary effect, fake repeat trick is useful
test_rep=[test-2.*pi,test(2:end-1),test+2.*pi];
fest_rep=[fest,fest(2:end-1),fest];

% calculate
fest_noise_smooth=arrayfun(@(tinq) wtbnd(test_rep,fest_rep,tinq,sig,'gaus'), tinq_vec);
fest_noise_1st=arrayfun(@(tinq) wtbnd(test_rep,fest_rep,tinq,sig,'gaus1'), tinq_vec);
fest_noise_2nd=arrayfun(@(tinq) wtbnd(test_rep,fest_rep,tinq,sig,'gaus2'), tinq_vec);


%% check results

% exact 1-st derivative
fest_1st=fest.*(2.*cos(test).*cos(2.*test)-sin(test).*sin(2.*test));
% exact 2-nd derivative
fest_2nd=0.125.*fest.*(10 + 7.*cos(2.*test) + 6.*cos(4.*test) + 9.*cos(6.*test) - 4.*sin(test) - 36.*sin(3.*test));
% plot
figure
subplot(3,1,1)
plot(test,fest,'-',test,fest_noise,'o',test,fest_noise_smooth,'--')
subplot(3,1,2)
plot(test,fest_1st,'-',test,fest_noise_1st,'--')
subplot(3,1,3)
plot(test,fest_2nd,'-',test,fest_noise_2nd,'--')