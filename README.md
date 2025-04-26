# 🌾 Szedo Harvest Zones

![GitHub Repo Stars](https://img.shields.io/github/stars/mr441/szedo_harvestzones?style=social) ![GitHub Forks](https://img.shields.io/github/forks/mr441/szedo_harvestzones?style=social) ![License](https://img.shields.io/badge/license-MIT-blue.svg)

Welcome to the **Szedo Harvest Zones** repository! This ESX-based harvest zone script for FiveM allows you to create customizable harvest zones with various materials, notifications, and progress bars. Perfect for enhancing your gaming experience in the FiveM environment.

## 📦 Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Commands](#commands)
- [Notifications](#notifications)
- [Progress Bar](#progress-bar)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## ✨ Features

- **Configurable Materials**: Choose from a variety of materials for harvesting.
- **Notifications**: Get real-time updates on your harvesting progress.
- **Progress Bar**: Visual feedback while harvesting.
- **Easy Setup**: Simple installation process for quick deployment.
- **ESX Integration**: Works seamlessly with the ESX framework.

## 📥 Installation

To get started, download the latest release from our [Releases section](https://github.com/mr441/szedo_harvestzones/releases). Once downloaded, follow these steps:

1. Extract the files to your FiveM resources directory.
2. Add `start szedo_harvestzones` to your server configuration file (`server.cfg`).
3. Restart your server.

## ⚙️ Configuration

You can customize the script by editing the `config.lua` file. Here are some key settings:

```lua
Config = {}

Config.HarvestZones = {
    { name = "Wheat", coords = vector3(1000, 2000, 30), material = "wheat" },
    { name = "Corn", coords = vector3(1100, 2100, 30), material = "corn" },
}

Config.NotificationType = "okoknotify" -- Change to your preferred notification system
Config.ProgressBarDuration = 5000 -- Duration in milliseconds
```

Feel free to add or modify zones according to your server's needs.

## 🎮 Usage

To start harvesting, simply walk into a designated harvest zone. You will receive a notification prompting you to begin the process. 

1. Press the interaction key (default: E).
2. Wait for the progress bar to complete.
3. Collect your materials!

## 🛠️ Commands

The following commands are available for managing harvest zones:

- `/addzone`: Add a new harvest zone.
- `/removezone`: Remove an existing harvest zone.
- `/listzones`: List all active harvest zones.

Use these commands to easily manage your harvest zones in-game.

## 📢 Notifications

Notifications help keep players informed about their actions. You can choose from various notification systems. The default is `okoknotify`, but you can change this in the `config.lua` file. 

Here's an example of how to send a notification:

```lua
if Config.NotificationType == "okoknotify" then
    TriggerEvent('okokNotify:Alert', 'Harvesting', 'You are harvesting wheat!', 5000, 'success')
end
```

## 📊 Progress Bar

The progress bar gives players a visual indication of their harvesting status. You can customize the duration in the `config.lua` file. The default duration is set to 5000 milliseconds (5 seconds).

```lua
exports['progressbar']:startUI(Config.ProgressBarDuration, 'Harvesting...')
```

## 🎨 Customization

You can further customize the look and feel of the notifications and progress bar by editing the respective files in the script. For example, you can change colors, icons, and sounds to match your server's theme.

## 🤝 Contributing

We welcome contributions! If you would like to help improve this script, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them.
4. Push your changes to your forked repository.
5. Submit a pull request.

Please ensure that your code follows the existing style and includes appropriate comments.

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## 📞 Contact

For any questions or support, feel free to reach out:

- GitHub: [mr441](https://github.com/mr441)
- Email: support@example.com

Thank you for checking out **Szedo Harvest Zones**! We hope you enjoy using this script and that it enhances your FiveM experience. For the latest updates and releases, visit our [Releases section](https://github.com/mr441/szedo_harvestzones/releases).