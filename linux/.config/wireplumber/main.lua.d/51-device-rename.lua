rule1 = {
    matches = {
        {
            { "node.name", "equals", "alsa_output.pci-0000_21_00.3.analog-stereo" },
        },
    },
    apply_properties = {
        ["node.description"] = "Speakers & Headphones",
    },
}

table.insert(alsa_monitor.rules, rule1)

rule2 = {
    matches = {
        {
            { "device.name", "equals", "alsa_card.pci-0000_21_00.3" },
        },
    },
    apply_properties = {
        ["device.description"] = "Realtek HD Audio ALC892",
    },
}

table.insert(alsa_monitor.rules, rule2)
