function testing(freqs, power)
    fig = figure("Visible", "off");
    subplot(1, 2, 1);
    hold on;
    plot(freqs, abs(power{1}));
    subplot(1, 2, 2);
    plot(power{1});

    sgtitle(sprintf("Subject %d Absolute vs. Real Power", 27));
    cd("Results");
    saveas(fig, sprintf("Subject_%d.png", 27));
    close(fig);
end
   