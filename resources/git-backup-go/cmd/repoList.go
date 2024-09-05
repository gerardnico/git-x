/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

// repoListCmd represents the repoList command
var repoListCmd = &cobra.Command{
	Use:   "repo-list",
	Short: "List Git repositories",
	Long:  `This function permits to list repositories in a registry`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("repo-list called")

		if len(args) == 0 {
			_ = cmd.Help()
			os.Exit(1)
		}
	},
}

func init() {
	rootCmd.AddCommand(repoListCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	repoListCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// repoListCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
