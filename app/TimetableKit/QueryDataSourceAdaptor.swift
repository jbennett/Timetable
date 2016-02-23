//
//  Shim.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-24.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import RealmSwift

public class QueryDataSourceAdaptor<Source: Object, Destination> {

  let query: DynamicQuery<Source>
  let dataSource: SimpleDataSource<Destination>

  public var conversionFunction: (Source -> Destination)?

  public init(query: DynamicQuery<Source>, dataSource: SimpleDataSource<Destination>) {
    self.query = query
    self.dataSource = dataSource

    query.itemsUpdateCallback = self.queryCallback
  }

  public func queryCallback(input: [Source]) {
    guard let conversionFunction = conversionFunction else { return }

    dataSource.data = input.map { conversionFunction($0) }
  }

}
