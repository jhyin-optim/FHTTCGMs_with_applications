function phi_1 = Phi_1Fun(t,alpha)
% phi 函数的1阶导数公式
    phi_1 = t./(t.^2 + alpha).^(1/2);
end

  %phi_2 = t./(t.^2 + alpha).^(1/2);