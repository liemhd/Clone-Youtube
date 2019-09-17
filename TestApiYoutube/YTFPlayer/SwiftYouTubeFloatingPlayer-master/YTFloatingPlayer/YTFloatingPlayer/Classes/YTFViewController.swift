//
//  YTDViewController.swift
//  YTDraggablePlayer
//
//  Created by Ana Paula on 5/23/16.
//  Copyright © 2016 Ana Paula. All rights reserved.
//

import UIKit

class YTFViewController: UIViewController {
    
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var fullscreen: UIButton!
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewContainer: UIView!
    @IBOutlet weak var minimizeButton: YTFPopupCloseButton!
    @IBOutlet weak var playerControlsView: UIView!
    @IBOutlet weak var backPlayerControlsView: UIView!
    @IBOutlet weak var slider: CustomSlider!
    @IBOutlet weak var progress: CustomProgress!
    @IBOutlet weak var entireTime: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var progressIndicatorView: UIActivityIndicatorView!
    var delegate: UITableViewDelegate?
    var dataSource: UITableViewDataSource?
    var tableCellNibName: String?
    var isOpen: Bool = false
    
    var isPlaying: Bool = false
    var isFullscreen: Bool = false
    var dragginSlider: Bool = false
    var isMinimized: Bool = false
    var hideTimer: NSTimer?
    var currentUrlIndex: Int = 0 {
        didSet {
            if (playerView != nil) {
                // Finish playing all items
                if (currentUrlIndex >= urls?.count) {
                    // Go back to first tableView item to loop list
                    currentUrlIndex = 0
                    selectFirstRowOfTable()
                } else {
                    playIndex(currentUrlIndex)
                }
            }
        }
    }
    var urls: [NSURL]? {
        didSet {
            if (playerView != nil) {
                currentUrlIndex = 0
            }
        }
    }
    
    var playerControlsFrame: CGRect?
    var playerViewFrame: CGRect?
    var tableViewContainerFrame: CGRect?
    var playerViewMinimizedFrame: CGRect?
    var minimizedPlayerFrame: CGRect?
    var initialFirstViewFrame: CGRect?
    var viewMinimizedFrame: CGRect?
    var restrictOffset: Float?
    var restrictTrueOffset: Float?
    var restictYaxis: Float?
    var transparentView: UIView?
    var onView: UIView?
    var playerTapGesture: UITapGestureRecognizer?
    var panGestureDirection: UIPanGestureRecognizerDirection?
    var touchPositionStartY: CGFloat?
    var touchPositionStartX: CGFloat?
    
    enum UIPanGestureRecognizerDirection {
        case Undefined
        case Up
        case Down
        case Left
        case Right
    }
    
    override func viewDidLoad() {
        initPlayerWithURLs()
        initViews()
        playerView.delegate = self
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        calculateFrames()
    }
    
    func initPlayerWithURLs() {
        if (isMinimized) {
            expandViews()
        }
        playIndex(currentUrlIndex)
    }
    
    func initViews() {
        self.view.backgroundColor = UIColor.clearColor()
        self.view.alpha = 0.0
        playerControlsView.alpha = 0.0
        backPlayerControlsView.alpha = 0.0
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(YTFViewController.panAction(_:)))
        playerView.addGestureRecognizer(gesture)
        
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.rowHeight = CGFloat(76)
        tableView.registerNib(UINib(nibName: tableCellNibName!, bundle: nil), forCellReuseIdentifier: tableCellNibName!)
    }
    
    func calculateFrames() {
        self.initialFirstViewFrame = self.view.frame
        self.playerViewFrame = self.playerView.frame
        self.tableViewContainerFrame = self.tableViewContainer.frame
        self.playerViewMinimizedFrame = self.playerView.frame
        self.viewMinimizedFrame = self.tableViewContainer.frame
        self.playerControlsFrame = self.playerControlsView.frame
        
        playerView.translatesAutoresizingMaskIntoConstraints = true
        tableViewContainer.translatesAutoresizingMaskIntoConstraints = true
        playerControlsView.translatesAutoresizingMaskIntoConstraints = true
        backPlayerControlsView.translatesAutoresizingMaskIntoConstraints = true
        tableViewContainer.frame = self.initialFirstViewFrame!
        self.playerControlsView.frame = self.playerControlsFrame!
        
        transparentView = UIView.init(frame: initialFirstViewFrame!)
        transparentView?.backgroundColor = UIColor.blackColor()
        transparentView?.alpha = 0.0
        onView?.addSubview(transparentView!)
        
        self.restrictOffset = Float(self.initialFirstViewFrame!.size.width) - 200
        self.restrictTrueOffset = Float(self.initialFirstViewFrame!.size.height) - 180
        self.restictYaxis = Float(self.initialFirstViewFrame!.size.height - playerView.frame.size.height)
        
    }
    
    @IBAction func minimizeButtonTouched(sender: AnyObject) {
        minimizeViews()
    }
    
    func selectFirstRowOfTable() {
        let rowToSelect:NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        
        UIView.animateWithDuration(0.5, animations: {
            self.tableView.scrollToRowAtIndexPath(rowToSelect, atScrollPosition: .Top, animated: false)
        })
    }
    
}

