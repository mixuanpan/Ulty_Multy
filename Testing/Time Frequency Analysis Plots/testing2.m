function testing(freqs, power)
    fig = figure("Visible", "off");
    layout = tiledlayout(1, 2); 
    title(layout, "Subject %d Absolute vs. Real Power (Channel 1)", 27);
    nexttile;
    plot(freqs, abs(power{1}));
    nexttile;
    plot(freqs, power{1});
    xlabel(layout, "Frequency (Hz)");
    saveas(fig, sprintf("Subject_%d.png", 27));
    close(fig);
end
   