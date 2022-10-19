//
//  FilmsViewController.swift
//  RabitSlideMenuDemo0
//
//  Created by cuongdd on 18/10/2022.
//  Copyright © 2022 duycuong. All rights reserved.
//

import UIKit

class FilmsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    lazy private var searchView: UIView = {
        let view = SearchView.loadViewFromNib()
        return view
    }()
    
    private var viewModel = FilmsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        addObserver()
        tableView.registerCell(FilmTableViewCell.self)
    }
    
    private func setupUI() {
        showNavCustom()
        navigationItem.titleView = searchView
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func addObserver() {
        if let searchView = searchView as? SearchView {
            searchView.textDidChange = { [weak self] text in
                guard let `self` = self else {
                    return
                }
                self.viewModel.searchText = text
            }
        }
        viewModel.updateSearch = { [weak self] in
            guard let `self` = self else {
                return
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension FilmsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellType: FilmTableViewCell.self, forIndexPath: indexPath)
        cell.fillData(d: viewModel.listFilms[indexPath.row])
        return cell
    }
}
